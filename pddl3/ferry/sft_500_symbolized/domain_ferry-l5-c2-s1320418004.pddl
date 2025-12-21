(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_2 ?v3)
		(pred_4 ?v6)
		(pred_5 ?v6)
		(pred_6 ?v3 ?v6)
		(pred_3)
		(pred_1 ?v3))

   (:action op_2
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_4 ?v8) (pred_4 ?v1) (pred_5 ?v8))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v8))))


   (:action op_3
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_4 ?v5)
			    (pred_6 ?v4 ?v5) (pred_5 ?v5) (pred_3))
       :effect (and (pred_1 ?v4)
		    (not (pred_6 ?v4 ?v5)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_4 ?v5)
			    (pred_1 ?v4) (pred_5 ?v5))
       :effect (and (pred_6 ?v4 ?v5)
		    (pred_3)
		    (not (pred_1 ?v4)))))

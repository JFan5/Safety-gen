(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_6 ?v2)
		(pred_4 ?v6)
		(pred_5 ?v6)
		(pred_3 ?v2 ?v6)
		(pred_1)
		(pred_2 ?v2))

   (:action op_1
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_4 ?v8) (pred_4 ?v4) (pred_5 ?v8))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v8))))


   (:action op_2
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v5)
			    (pred_3 ?v1 ?v5) (pred_5 ?v5) (pred_1))
       :effect (and (pred_2 ?v1)
		    (not (pred_3 ?v1 ?v5)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v5)
			    (pred_2 ?v1) (pred_5 ?v5))
       :effect (and (pred_3 ?v1 ?v5)
		    (pred_1)
		    (not (pred_2 ?v1)))))

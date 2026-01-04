(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v3)
		(pred_4 ?v5)
		(pred_6 ?v6)
		(pred_2 ?v6)
		(pred_5 ?v5 ?v6)
		(pred_3)
		(pred_1 ?v5))

   (:action op_3
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_6 ?v8) (pred_6 ?v1) (pred_2 ?v8))
       :effect (and  (pred_2 ?v1)
		     (not (pred_2 ?v8))))


   (:action op_1
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_4 ?v2) (pred_6 ?v4)
			    (pred_5 ?v2 ?v4) (pred_2 ?v4) (pred_3))
       :effect (and (pred_1 ?v2)
		    (not (pred_5 ?v2 ?v4)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_4 ?v2) (pred_6 ?v4)
			    (pred_1 ?v2) (pred_2 ?v4))
       :effect (and (pred_5 ?v2 ?v4)
		    (pred_3)
		    (not (pred_1 ?v2)))))

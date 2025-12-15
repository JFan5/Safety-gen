(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v5)
		(pred_1 ?v4)
		(pred_3 ?v2)
		(pred_6 ?v2)
		(pred_5 ?v4 ?v2)
		(pred_4)
		(pred_2 ?v4))

   (:action op_1
       :parameters  (?v1 ?v6)
       :precondition (and (not-eq ?v1 ?v6) 
                          (pred_3 ?v1) (pred_3 ?v6) (pred_6 ?v1))
       :effect (and  (pred_6 ?v6)
		     (not (pred_6 ?v1))))


   (:action op_2
       :parameters (?v7 ?v3)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v3)
			    (pred_5 ?v7 ?v3) (pred_6 ?v3) (pred_4))
       :effect (and (pred_2 ?v7)
		    (not (pred_5 ?v7 ?v3)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v7  ?v3)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v3)
			    (pred_2 ?v7) (pred_6 ?v3))
       :effect (and (pred_5 ?v7 ?v3)
		    (pred_4)
		    (not (pred_2 ?v7)))))

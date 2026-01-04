(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_6 ?v4)
		(pred_3 ?v6)
		(pred_2 ?v6)
		(pred_5 ?v4 ?v6)
		(pred_1)
		(pred_4 ?v4))

   (:action op_2
       :parameters  (?v1 ?v7)
       :precondition (and (not-eq ?v1 ?v7) 
                          (pred_3 ?v1) (pred_3 ?v7) (pred_2 ?v1))
       :effect (and  (pred_2 ?v7)
		     (not (pred_2 ?v1))))


   (:action op_1
       :parameters (?v5 ?v3)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v3)
			    (pred_5 ?v5 ?v3) (pred_2 ?v3) (pred_1))
       :effect (and (pred_4 ?v5)
		    (not (pred_5 ?v5 ?v3)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v5  ?v3)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v3)
			    (pred_4 ?v5) (pred_2 ?v3))
       :effect (and (pred_5 ?v5 ?v3)
		    (pred_1)
		    (not (pred_4 ?v5)))))

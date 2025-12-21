(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v8)
		(pred_6 ?v5)
		(pred_5 ?v6)
		(pred_3 ?v6)
		(pred_4 ?v5 ?v6)
		(pred_1)
		(pred_2 ?v5))

   (:action op_1
       :parameters  (?v1 ?v7)
       :precondition (and (not-eq ?v1 ?v7) 
                          (pred_5 ?v1) (pred_5 ?v7) (pred_3 ?v1))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v1))))


   (:action op_2
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_6 ?v3) (pred_5 ?v2)
			    (pred_4 ?v3 ?v2) (pred_3 ?v2) (pred_1))
       :effect (and (pred_2 ?v3)
		    (not (pred_4 ?v3 ?v2)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_6 ?v3) (pred_5 ?v2)
			    (pred_2 ?v3) (pred_3 ?v2))
       :effect (and (pred_4 ?v3 ?v2)
		    (pred_1)
		    (not (pred_2 ?v3)))))

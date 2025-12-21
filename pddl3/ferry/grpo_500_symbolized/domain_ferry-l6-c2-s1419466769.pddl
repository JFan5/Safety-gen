(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_2 ?v6)
		(pred_6 ?v7)
		(pred_5 ?v7)
		(pred_1 ?v6 ?v7)
		(pred_4)
		(pred_3 ?v6))

   (:action op_2
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_6 ?v1) (pred_6 ?v8) (pred_5 ?v1))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v1))))


   (:action op_1
       :parameters (?v4 ?v2)
       :precondition  (and  (pred_2 ?v4) (pred_6 ?v2)
			    (pred_1 ?v4 ?v2) (pred_5 ?v2) (pred_4))
       :effect (and (pred_3 ?v4)
		    (not (pred_1 ?v4 ?v2)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v4  ?v2)
       :precondition  (and  (pred_2 ?v4) (pred_6 ?v2)
			    (pred_3 ?v4) (pred_5 ?v2))
       :effect (and (pred_1 ?v4 ?v2)
		    (pred_4)
		    (not (pred_3 ?v4)))))

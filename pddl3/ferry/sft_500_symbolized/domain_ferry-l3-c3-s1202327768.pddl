(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v8)
		(pred_5 ?v3)
		(pred_2 ?v4)
		(pred_1 ?v4)
		(pred_6 ?v3 ?v4)
		(pred_4)
		(pred_3 ?v3))

   (:action op_3
       :parameters  (?v7 ?v2)
       :precondition (and (not-eq ?v7 ?v2) 
                          (pred_2 ?v7) (pred_2 ?v2) (pred_1 ?v7))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v7))))


   (:action op_2
       :parameters (?v6 ?v1)
       :precondition  (and  (pred_5 ?v6) (pred_2 ?v1)
			    (pred_6 ?v6 ?v1) (pred_1 ?v1) (pred_4))
       :effect (and (pred_3 ?v6)
		    (not (pred_6 ?v6 ?v1)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v6  ?v1)
       :precondition  (and  (pred_5 ?v6) (pred_2 ?v1)
			    (pred_3 ?v6) (pred_1 ?v1))
       :effect (and (pred_6 ?v6 ?v1)
		    (pred_4)
		    (not (pred_3 ?v6)))))

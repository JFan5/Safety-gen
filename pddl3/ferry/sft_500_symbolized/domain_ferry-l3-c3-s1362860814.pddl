(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_3 ?v2)
		(pred_6 ?v8)
		(pred_1 ?v8)
		(pred_2 ?v2 ?v8)
		(pred_4)
		(pred_5 ?v2))

   (:action op_1
       :parameters  (?v7 ?v4)
       :precondition (and (not-eq ?v7 ?v4) 
                          (pred_6 ?v7) (pred_6 ?v4) (pred_1 ?v7))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v7))))


   (:action op_2
       :parameters (?v6 ?v1)
       :precondition  (and  (pred_3 ?v6) (pred_6 ?v1)
			    (pred_2 ?v6 ?v1) (pred_1 ?v1) (pred_4))
       :effect (and (pred_5 ?v6)
		    (not (pred_2 ?v6 ?v1)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v6  ?v1)
       :precondition  (and  (pred_3 ?v6) (pred_6 ?v1)
			    (pred_5 ?v6) (pred_1 ?v1))
       :effect (and (pred_2 ?v6 ?v1)
		    (pred_4)
		    (not (pred_5 ?v6)))))

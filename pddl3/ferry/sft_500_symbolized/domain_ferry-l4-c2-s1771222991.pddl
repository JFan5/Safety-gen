(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_6 ?v4)
		(pred_3 ?v8)
		(pred_1 ?v8)
		(pred_2 ?v4 ?v8)
		(pred_4)
		(pred_5 ?v4))

   (:action op_3
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_3 ?v7) (pred_3 ?v6) (pred_1 ?v7))
       :effect (and  (pred_1 ?v6)
		     (not (pred_1 ?v7))))


   (:action op_1
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_3 ?v2)
			    (pred_2 ?v1 ?v2) (pred_1 ?v2) (pred_4))
       :effect (and (pred_5 ?v1)
		    (not (pred_2 ?v1 ?v2)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_3 ?v2)
			    (pred_5 ?v1) (pred_1 ?v2))
       :effect (and (pred_2 ?v1 ?v2)
		    (pred_4)
		    (not (pred_5 ?v1)))))

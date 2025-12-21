(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v8)
		(pred_6 ?v6)
		(pred_2 ?v3)
		(pred_5 ?v3)
		(pred_1 ?v6 ?v3)
		(pred_3)
		(pred_4 ?v6))

   (:action op_1
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_2 ?v7) (pred_2 ?v5) (pred_5 ?v7))
       :effect (and  (pred_5 ?v5)
		     (not (pred_5 ?v7))))


   (:action op_2
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_2 ?v2)
			    (pred_1 ?v1 ?v2) (pred_5 ?v2) (pred_3))
       :effect (and (pred_4 ?v1)
		    (not (pred_1 ?v1 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_2 ?v2)
			    (pred_4 ?v1) (pred_5 ?v2))
       :effect (and (pred_1 ?v1 ?v2)
		    (pred_3)
		    (not (pred_4 ?v1)))))

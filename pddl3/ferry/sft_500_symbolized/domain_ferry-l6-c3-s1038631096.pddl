(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v8)
		(pred_3 ?v1)
		(pred_2 ?v5)
		(pred_5 ?v5)
		(pred_6 ?v1 ?v5)
		(pred_4)
		(pred_1 ?v1))

   (:action op_2
       :parameters  (?v6 ?v7)
       :precondition (and (not-eq ?v6 ?v7) 
                          (pred_2 ?v6) (pred_2 ?v7) (pred_5 ?v6))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v6))))


   (:action op_1
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v2)
			    (pred_6 ?v3 ?v2) (pred_5 ?v2) (pred_4))
       :effect (and (pred_1 ?v3)
		    (not (pred_6 ?v3 ?v2)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v2)
			    (pred_1 ?v3) (pred_5 ?v2))
       :effect (and (pred_6 ?v3 ?v2)
		    (pred_4)
		    (not (pred_1 ?v3)))))

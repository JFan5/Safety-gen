(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v5)
		(pred_2 ?v7)
		(pred_1 ?v4)
		(pred_3 ?v4)
		(pred_5 ?v7 ?v4)
		(pred_6)
		(pred_4 ?v7))

   (:action op_1
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_1 ?v6) (pred_1 ?v8) (pred_3 ?v6))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v6))))


   (:action op_3
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v2)
			    (pred_5 ?v3 ?v2) (pred_3 ?v2) (pred_6))
       :effect (and (pred_4 ?v3)
		    (not (pred_5 ?v3 ?v2)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v2)
			    (pred_4 ?v3) (pred_3 ?v2))
       :effect (and (pred_5 ?v3 ?v2)
		    (pred_6)
		    (not (pred_4 ?v3)))))

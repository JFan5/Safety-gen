(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_2 ?v5)
		(pred_1 ?v8)
		(pred_5 ?v8)
		(pred_4 ?v5 ?v8)
		(pred_6)
		(pred_3 ?v5))

   (:action op_1
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_1 ?v7) (pred_1 ?v6) (pred_5 ?v7))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v7))))


   (:action op_2
       :parameters (?v4 ?v2)
       :precondition  (and  (pred_2 ?v4) (pred_1 ?v2)
			    (pred_4 ?v4 ?v2) (pred_5 ?v2) (pred_6))
       :effect (and (pred_3 ?v4)
		    (not (pred_4 ?v4 ?v2)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v4  ?v2)
       :precondition  (and  (pred_2 ?v4) (pred_1 ?v2)
			    (pred_3 ?v4) (pred_5 ?v2))
       :effect (and (pred_4 ?v4 ?v2)
		    (pred_6)
		    (not (pred_3 ?v4)))))

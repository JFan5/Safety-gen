(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_4 ?v4)
		(pred_1 ?v1)
		(pred_2 ?v1)
		(pred_5 ?v4 ?v1)
		(pred_6)
		(pred_3 ?v4))

   (:action op_3
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_1 ?v2) (pred_1 ?v5) (pred_2 ?v2))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v2))))


   (:action op_2
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_4 ?v7) (pred_1 ?v6)
			    (pred_5 ?v7 ?v6) (pred_2 ?v6) (pred_6))
       :effect (and (pred_3 ?v7)
		    (not (pred_5 ?v7 ?v6)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_4 ?v7) (pred_1 ?v6)
			    (pred_3 ?v7) (pred_2 ?v6))
       :effect (and (pred_5 ?v7 ?v6)
		    (pred_6)
		    (not (pred_3 ?v7)))))

(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_1 ?v5)
		(pred_2 ?v1)
		(pred_4 ?v1)
		(pred_3 ?v5 ?v1)
		(pred_6)
		(pred_5 ?v5))

   (:action op_1
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_2 ?v2) (pred_2 ?v7) (pred_4 ?v2))
       :effect (and  (pred_4 ?v7)
		     (not (pred_4 ?v2))))


   (:action op_3
       :parameters (?v4 ?v6)
       :precondition  (and  (pred_1 ?v4) (pred_2 ?v6)
			    (pred_3 ?v4 ?v6) (pred_4 ?v6) (pred_6))
       :effect (and (pred_5 ?v4)
		    (not (pred_3 ?v4 ?v6)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v4  ?v6)
       :precondition  (and  (pred_1 ?v4) (pred_2 ?v6)
			    (pred_5 ?v4) (pred_4 ?v6))
       :effect (and (pred_3 ?v4 ?v6)
		    (pred_6)
		    (not (pred_5 ?v4)))))

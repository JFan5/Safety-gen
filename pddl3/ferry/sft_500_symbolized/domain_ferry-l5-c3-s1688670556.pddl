(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v8)
		(pred_3 ?v1)
		(pred_4 ?v4)
		(pred_1 ?v4)
		(pred_5 ?v1 ?v4)
		(pred_6)
		(pred_2 ?v1))

   (:action op_3
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_4 ?v2) (pred_4 ?v7) (pred_1 ?v2))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v2))))


   (:action op_1
       :parameters (?v3 ?v6)
       :precondition  (and  (pred_3 ?v3) (pred_4 ?v6)
			    (pred_5 ?v3 ?v6) (pred_1 ?v6) (pred_6))
       :effect (and (pred_2 ?v3)
		    (not (pred_5 ?v3 ?v6)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v3  ?v6)
       :precondition  (and  (pred_3 ?v3) (pred_4 ?v6)
			    (pred_2 ?v3) (pred_1 ?v6))
       :effect (and (pred_5 ?v3 ?v6)
		    (pred_6)
		    (not (pred_2 ?v3)))))

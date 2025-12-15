(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_2 ?v6)
		(pred_1 ?v8)
		(pred_5 ?v8)
		(pred_3 ?v6 ?v8)
		(pred_6)
		(pred_4 ?v6))

   (:action op_3
       :parameters  (?v5 ?v2)
       :precondition (and (not-eq ?v5 ?v2) 
                          (pred_1 ?v5) (pred_1 ?v2) (pred_5 ?v5))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v5))))


   (:action op_2
       :parameters (?v3 ?v7)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v7)
			    (pred_3 ?v3 ?v7) (pred_5 ?v7) (pred_6))
       :effect (and (pred_4 ?v3)
		    (not (pred_3 ?v3 ?v7)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v3  ?v7)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v7)
			    (pred_4 ?v3) (pred_5 ?v7))
       :effect (and (pred_3 ?v3 ?v7)
		    (pred_6)
		    (not (pred_4 ?v3)))))

(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_2 ?v8)
		(pred_1 ?v5)
		(pred_5 ?v5)
		(pred_6 ?v8 ?v5)
		(pred_3)
		(pred_4 ?v8))

   (:action op_1
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_1 ?v6) (pred_1 ?v3) (pred_5 ?v6))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v6))))


   (:action op_2
       :parameters (?v2 ?v7)
       :precondition  (and  (pred_2 ?v2) (pred_1 ?v7)
			    (pred_6 ?v2 ?v7) (pred_5 ?v7) (pred_3))
       :effect (and (pred_4 ?v2)
		    (not (pred_6 ?v2 ?v7)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v2  ?v7)
       :precondition  (and  (pred_2 ?v2) (pred_1 ?v7)
			    (pred_4 ?v2) (pred_5 ?v7))
       :effect (and (pred_6 ?v2 ?v7)
		    (pred_3)
		    (not (pred_4 ?v2)))))

(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v5)
		(pred_1 ?v2)
		(pred_3 ?v4)
		(pred_2 ?v4)
		(pred_5 ?v2 ?v4)
		(pred_6)
		(pred_4 ?v2))

   (:action op_3
       :parameters  (?v7 ?v3)
       :precondition (and (not-eq ?v7 ?v3) 
                          (pred_3 ?v7) (pred_3 ?v3) (pred_2 ?v7))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v7))))


   (:action op_1
       :parameters (?v6 ?v8)
       :precondition  (and  (pred_1 ?v6) (pred_3 ?v8)
			    (pred_5 ?v6 ?v8) (pred_2 ?v8) (pred_6))
       :effect (and (pred_4 ?v6)
		    (not (pred_5 ?v6 ?v8)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v6  ?v8)
       :precondition  (and  (pred_1 ?v6) (pred_3 ?v8)
			    (pred_4 ?v6) (pred_2 ?v8))
       :effect (and (pred_5 ?v6 ?v8)
		    (pred_6)
		    (not (pred_4 ?v6)))))

(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_4 ?v5)
		(pred_5 ?v1)
		(pred_1 ?v1)
		(pred_2 ?v5 ?v1)
		(pred_6)
		(pred_3 ?v5))

   (:action op_3
       :parameters  (?v6 ?v7)
       :precondition (and (not-eq ?v6 ?v7) 
                          (pred_5 ?v6) (pred_5 ?v7) (pred_1 ?v6))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v6))))


   (:action op_1
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_4 ?v8) (pred_5 ?v2)
			    (pred_2 ?v8 ?v2) (pred_1 ?v2) (pred_6))
       :effect (and (pred_3 ?v8)
		    (not (pred_2 ?v8 ?v2)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_4 ?v8) (pred_5 ?v2)
			    (pred_3 ?v8) (pred_1 ?v2))
       :effect (and (pred_2 ?v8 ?v2)
		    (pred_6)
		    (not (pred_3 ?v8)))))

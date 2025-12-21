(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_2 ?v1)
		(pred_3 ?v2)
		(pred_1 ?v2)
		(pred_5 ?v1 ?v2)
		(pred_6)
		(pred_4 ?v1))

   (:action op_3
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_3 ?v6) (pred_3 ?v5) (pred_1 ?v6))
       :effect (and  (pred_1 ?v5)
		     (not (pred_1 ?v6))))


   (:action op_2
       :parameters (?v8 ?v4)
       :precondition  (and  (pred_2 ?v8) (pred_3 ?v4)
			    (pred_5 ?v8 ?v4) (pred_1 ?v4) (pred_6))
       :effect (and (pred_4 ?v8)
		    (not (pred_5 ?v8 ?v4)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v8  ?v4)
       :precondition  (and  (pred_2 ?v8) (pred_3 ?v4)
			    (pred_4 ?v8) (pred_1 ?v4))
       :effect (and (pred_5 ?v8 ?v4)
		    (pred_6)
		    (not (pred_4 ?v8)))))

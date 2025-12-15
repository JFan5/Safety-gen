(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v3)
		(pred_6 ?v5)
		(pred_2 ?v4)
		(pred_4 ?v4)
		(pred_3 ?v5 ?v4)
		(pred_1)
		(pred_5 ?v5))

   (:action op_2
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_2 ?v6) (pred_2 ?v8) (pred_4 ?v6))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v6))))


   (:action op_3
       :parameters (?v2 ?v7)
       :precondition  (and  (pred_6 ?v2) (pred_2 ?v7)
			    (pred_3 ?v2 ?v7) (pred_4 ?v7) (pred_1))
       :effect (and (pred_5 ?v2)
		    (not (pred_3 ?v2 ?v7)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v2  ?v7)
       :precondition  (and  (pred_6 ?v2) (pred_2 ?v7)
			    (pred_5 ?v2) (pred_4 ?v7))
       :effect (and (pred_3 ?v2 ?v7)
		    (pred_1)
		    (not (pred_5 ?v2)))))

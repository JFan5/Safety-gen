(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_6 ?v1)
		(pred_4 ?v2)
		(pred_5 ?v2)
		(pred_3 ?v1 ?v2)
		(pred_1)
		(pred_2 ?v1))

   (:action op_1
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_4 ?v6) (pred_4 ?v5) (pred_5 ?v6))
       :effect (and  (pred_5 ?v5)
		     (not (pred_5 ?v6))))


   (:action op_3
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_6 ?v8) (pred_4 ?v7)
			    (pred_3 ?v8 ?v7) (pred_5 ?v7) (pred_1))
       :effect (and (pred_2 ?v8)
		    (not (pred_3 ?v8 ?v7)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_6 ?v8) (pred_4 ?v7)
			    (pred_2 ?v8) (pred_5 ?v7))
       :effect (and (pred_3 ?v8 ?v7)
		    (pred_1)
		    (not (pred_2 ?v8)))))

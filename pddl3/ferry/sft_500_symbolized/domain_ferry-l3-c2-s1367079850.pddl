(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v6)
		(pred_4 ?v4)
		(pred_5 ?v5)
		(pred_3 ?v5)
		(pred_2 ?v4 ?v5)
		(pred_6)
		(pred_1 ?v4))

   (:action op_3
       :parameters  (?v7 ?v1)
       :precondition (and (not-eq ?v7 ?v1) 
                          (pred_5 ?v7) (pred_5 ?v1) (pred_3 ?v7))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v7))))


   (:action op_1
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_4 ?v8) (pred_5 ?v2)
			    (pred_2 ?v8 ?v2) (pred_3 ?v2) (pred_6))
       :effect (and (pred_1 ?v8)
		    (not (pred_2 ?v8 ?v2)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_4 ?v8) (pred_5 ?v2)
			    (pred_1 ?v8) (pred_3 ?v2))
       :effect (and (pred_2 ?v8 ?v2)
		    (pred_6)
		    (not (pred_1 ?v8)))))

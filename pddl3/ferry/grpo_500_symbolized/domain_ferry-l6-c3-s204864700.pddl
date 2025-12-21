(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v6)
		(pred_1 ?v8)
		(pred_3 ?v3)
		(pred_5 ?v3)
		(pred_4 ?v8 ?v3)
		(pred_6)
		(pred_2 ?v8))

   (:action op_3
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_3 ?v1) (pred_3 ?v4) (pred_5 ?v1))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v1))))


   (:action op_1
       :parameters (?v2 ?v7)
       :precondition  (and  (pred_1 ?v2) (pred_3 ?v7)
			    (pred_4 ?v2 ?v7) (pred_5 ?v7) (pred_6))
       :effect (and (pred_2 ?v2)
		    (not (pred_4 ?v2 ?v7)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v2  ?v7)
       :precondition  (and  (pred_1 ?v2) (pred_3 ?v7)
			    (pred_2 ?v2) (pred_5 ?v7))
       :effect (and (pred_4 ?v2 ?v7)
		    (pred_6)
		    (not (pred_2 ?v2)))))

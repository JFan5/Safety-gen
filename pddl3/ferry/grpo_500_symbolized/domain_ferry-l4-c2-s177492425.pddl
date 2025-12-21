(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_3 ?v5)
		(pred_1 ?v2)
		(pred_5 ?v2)
		(pred_4 ?v5 ?v2)
		(pred_6)
		(pred_2 ?v5))

   (:action op_1
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_1 ?v8) (pred_1 ?v1) (pred_5 ?v8))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v8))))


   (:action op_3
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v6)
			    (pred_4 ?v7 ?v6) (pred_5 ?v6) (pred_6))
       :effect (and (pred_2 ?v7)
		    (not (pred_4 ?v7 ?v6)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v6)
			    (pred_2 ?v7) (pred_5 ?v6))
       :effect (and (pred_4 ?v7 ?v6)
		    (pred_6)
		    (not (pred_2 ?v7)))))

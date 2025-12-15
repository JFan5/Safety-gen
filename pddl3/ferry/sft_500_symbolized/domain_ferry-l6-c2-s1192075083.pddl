(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v4)
		(pred_4 ?v7)
		(pred_1 ?v6)
		(pred_5 ?v6)
		(pred_3 ?v7 ?v6)
		(pred_6)
		(pred_2 ?v7))

   (:action op_3
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_1 ?v8) (pred_1 ?v3) (pred_5 ?v8))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v8))))


   (:action op_1
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_4 ?v5) (pred_1 ?v1)
			    (pred_3 ?v5 ?v1) (pred_5 ?v1) (pred_6))
       :effect (and (pred_2 ?v5)
		    (not (pred_3 ?v5 ?v1)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_4 ?v5) (pred_1 ?v1)
			    (pred_2 ?v5) (pred_5 ?v1))
       :effect (and (pred_3 ?v5 ?v1)
		    (pred_6)
		    (not (pred_2 ?v5)))))

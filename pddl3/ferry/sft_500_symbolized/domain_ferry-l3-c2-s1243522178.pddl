(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_4 ?v7)
		(pred_5 ?v6)
		(pred_3 ?v6)
		(pred_2 ?v7 ?v6)
		(pred_6)
		(pred_1 ?v7))

   (:action op_3
       :parameters  (?v8 ?v5)
       :precondition (and (not-eq ?v8 ?v5) 
                          (pred_5 ?v8) (pred_5 ?v5) (pred_3 ?v8))
       :effect (and  (pred_3 ?v5)
		     (not (pred_3 ?v8))))


   (:action op_2
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v4)
			    (pred_2 ?v3 ?v4) (pred_3 ?v4) (pred_6))
       :effect (and (pred_1 ?v3)
		    (not (pred_2 ?v3 ?v4)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v4)
			    (pred_1 ?v3) (pred_3 ?v4))
       :effect (and (pred_2 ?v3 ?v4)
		    (pred_6)
		    (not (pred_1 ?v3)))))

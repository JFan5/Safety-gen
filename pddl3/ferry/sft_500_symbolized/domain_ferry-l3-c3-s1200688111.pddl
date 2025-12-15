(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_2 ?v3)
		(pred_5 ?v2)
		(pred_1 ?v2)
		(pred_3 ?v3 ?v2)
		(pred_6)
		(pred_4 ?v3))

   (:action op_3
       :parameters  (?v8 ?v7)
       :precondition (and (not-eq ?v8 ?v7) 
                          (pred_5 ?v8) (pred_5 ?v7) (pred_1 ?v8))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v8))))


   (:action op_1
       :parameters (?v4 ?v1)
       :precondition  (and  (pred_2 ?v4) (pred_5 ?v1)
			    (pred_3 ?v4 ?v1) (pred_1 ?v1) (pred_6))
       :effect (and (pred_4 ?v4)
		    (not (pred_3 ?v4 ?v1)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v4  ?v1)
       :precondition  (and  (pred_2 ?v4) (pred_5 ?v1)
			    (pred_4 ?v4) (pred_1 ?v1))
       :effect (and (pred_3 ?v4 ?v1)
		    (pred_6)
		    (not (pred_4 ?v4)))))

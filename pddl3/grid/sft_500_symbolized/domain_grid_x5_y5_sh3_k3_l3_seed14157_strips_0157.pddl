(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v1 ?v13)
             (pred_7 ?v9 ?v6)
             (pred_11 ?v1 ?v6)
             (pred_5 ?v2 ?v1 )
	     (pred_10 ?v1)
             (pred_2 ?v5)
             (pred_1 ?v9)
             (pred_9 ?v6)
             (pred_3 ?v1)
             (pred_8 ?v9)
             (pred_4 ?v1)
             (pred_12 ))



(:action op_3
:parameters (?v7 ?v3 ?v8 ?v11)
:precondition (and (pred_2 ?v7) (pred_2 ?v3) (pred_1 ?v8) (pred_9 ?v11)
          (pred_6 ?v7 ?v3) (pred_7 ?v8 ?v11)
                   (pred_11 ?v3 ?v11) (pred_10 ?v7) 
                   (pred_3 ?v3) (pred_8 ?v8))
:effect (and  (pred_4 ?v3) (not (pred_3 ?v3))))


(:action op_2
:parameters (?v7 ?v4)
:precondition (and (pred_2 ?v7) (pred_2 ?v4)
               (pred_10 ?v7) (pred_6 ?v7 ?v4) (pred_4 ?v4))
:effect (and (pred_10 ?v4) (not (pred_10 ?v7))))

(:action op_4
:parameters (?v7 ?v8)
:precondition (and (pred_2 ?v7) (pred_1 ?v8) 
                  (pred_10 ?v7) (pred_5 ?v8 ?v7) (pred_12 ))
:effect (and (pred_8 ?v8)
   (not (pred_5 ?v8 ?v7)) (not (pred_12 ))))


(:action op_1
:parameters (?v7 ?v12 ?v10)
:precondition (and (pred_2 ?v7) (pred_1 ?v12) (pred_1 ?v10)
                  (pred_10 ?v7) (pred_8 ?v10) (pred_5 ?v12 ?v7))
:effect (and (pred_8 ?v12) (pred_5 ?v10 ?v7)
        (not (pred_8 ?v10)) (not (pred_5 ?v12 ?v7))))

(:action op_5
:parameters (?v7 ?v8)
:precondition (and (pred_2 ?v7) (pred_1 ?v8) 
                  (pred_10 ?v7) (pred_8 ?v8))
:effect (and (pred_12 ) (pred_5 ?v8 ?v7) (not (pred_8 ?v8)))))


	

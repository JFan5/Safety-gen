(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v10 ?v2)
             (pred_5 ?v3 ?v9)
             (pred_4 ?v10 ?v9)
             (pred_8 ?v13 ?v10 )
	     (pred_1 ?v10)
             (pred_12 ?v5)
             (pred_6 ?v3)
             (pred_9 ?v9)
             (pred_7 ?v10)
             (pred_3 ?v3)
             (pred_11 ?v10)
             (pred_10 ))



(:action op_4
:parameters (?v11 ?v12 ?v1 ?v8)
:precondition (and (pred_12 ?v11) (pred_12 ?v12) (pred_6 ?v1) (pred_9 ?v8)
          (pred_2 ?v11 ?v12) (pred_5 ?v1 ?v8)
                   (pred_4 ?v12 ?v8) (pred_1 ?v11) 
                   (pred_7 ?v12) (pred_3 ?v1))
:effect (and  (pred_11 ?v12) (not (pred_7 ?v12))))


(:action op_5
:parameters (?v11 ?v7)
:precondition (and (pred_12 ?v11) (pred_12 ?v7)
               (pred_1 ?v11) (pred_2 ?v11 ?v7) (pred_11 ?v7))
:effect (and (pred_1 ?v7) (not (pred_1 ?v11))))

(:action op_3
:parameters (?v11 ?v1)
:precondition (and (pred_12 ?v11) (pred_6 ?v1) 
                  (pred_1 ?v11) (pred_8 ?v1 ?v11) (pred_10 ))
:effect (and (pred_3 ?v1)
   (not (pred_8 ?v1 ?v11)) (not (pred_10 ))))


(:action op_2
:parameters (?v11 ?v4 ?v6)
:precondition (and (pred_12 ?v11) (pred_6 ?v4) (pred_6 ?v6)
                  (pred_1 ?v11) (pred_3 ?v6) (pred_8 ?v4 ?v11))
:effect (and (pred_3 ?v4) (pred_8 ?v6 ?v11)
        (not (pred_3 ?v6)) (not (pred_8 ?v4 ?v11))))

(:action op_1
:parameters (?v11 ?v1)
:precondition (and (pred_12 ?v11) (pred_6 ?v1) 
                  (pred_1 ?v11) (pred_3 ?v1))
:effect (and (pred_10 ) (pred_8 ?v1 ?v11) (not (pred_3 ?v1)))))


	

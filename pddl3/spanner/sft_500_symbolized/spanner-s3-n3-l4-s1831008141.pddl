; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1831008141 --problem-name spanner-s3-n3-l4-s1831008141
(define (problem spanner-s3-n3-l4-s1831008141)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_10 obj_09 obj_02 - type_1
     obj_11 obj_01 obj_06 - type_2
     obj_13 obj_03 obj_08 obj_05 - type_5
     obj_07 obj_04 - type_5
    )
 (:init 
    (pred_2 obj_12 obj_07)
    (pred_2 obj_10 obj_08)
    (pred_1 obj_10)
    (pred_2 obj_09 obj_08)
    (pred_1 obj_09)
    (pred_2 obj_02 obj_08)
    (pred_1 obj_02)
    (pred_6 obj_11)
    (pred_2 obj_11 obj_04)
    (pred_6 obj_01)
    (pred_2 obj_01 obj_04)
    (pred_6 obj_06)
    (pred_2 obj_06 obj_04)
    (pred_4 obj_07 obj_13)
    (pred_4 obj_05 obj_04)
    (pred_4 obj_13 obj_03)
    (pred_4 obj_03 obj_08)
    (pred_4 obj_08 obj_05)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_01)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_07)))
  )
)
)

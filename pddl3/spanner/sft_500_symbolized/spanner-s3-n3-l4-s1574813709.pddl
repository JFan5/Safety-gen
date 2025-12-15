; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1574813709 --problem-name spanner-s3-n3-l4-s1574813709
(define (problem spanner-s3-n3-l4-s1574813709)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_05 obj_09 obj_08 - type_1
     obj_06 obj_13 obj_12 - type_5
     obj_03 obj_04 obj_11 obj_07 - type_2
     obj_10 obj_02 - type_2
    )
 (:init 
    (pred_6 obj_01 obj_10)
    (pred_6 obj_05 obj_11)
    (pred_1 obj_05)
    (pred_6 obj_09 obj_04)
    (pred_1 obj_09)
    (pred_6 obj_08 obj_11)
    (pred_1 obj_08)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_02)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_02)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_02)
    (pred_2 obj_10 obj_03)
    (pred_2 obj_07 obj_02)
    (pred_2 obj_03 obj_04)
    (pred_2 obj_04 obj_11)
    (pred_2 obj_11 obj_07)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_13)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_10)))
  )
)
)

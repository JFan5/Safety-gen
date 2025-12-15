; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1070754393 --problem-name spanner-s4-n3-l4-s1070754393
(define (problem spanner-s4-n3-l4-s1070754393)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_10 obj_07 obj_09 obj_12 - type_3
     obj_05 obj_14 obj_04 - type_4
     obj_13 obj_08 obj_01 obj_02 - type_5
     obj_11 obj_03 - type_5
    )
 (:init 
    (pred_6 obj_06 obj_11)
    (pred_6 obj_10 obj_08)
    (pred_2 obj_10)
    (pred_6 obj_07 obj_08)
    (pred_2 obj_07)
    (pred_6 obj_09 obj_01)
    (pred_2 obj_09)
    (pred_6 obj_12 obj_13)
    (pred_2 obj_12)
    (pred_5 obj_05)
    (pred_6 obj_05 obj_03)
    (pred_5 obj_14)
    (pred_6 obj_14 obj_03)
    (pred_5 obj_04)
    (pred_6 obj_04 obj_03)
    (pred_3 obj_11 obj_13)
    (pred_3 obj_02 obj_03)
    (pred_3 obj_13 obj_08)
    (pred_3 obj_08 obj_01)
    (pred_3 obj_01 obj_02)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_14)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_14))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_11)))
  )
)
)

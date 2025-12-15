; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1235992602 --problem-name spanner-s4-n3-l4-s1235992602
(define (problem spanner-s4-n3-l4-s1235992602)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_05 obj_07 obj_12 obj_02 - type_5
     obj_03 obj_09 obj_04 - type_4
     obj_10 obj_06 obj_13 obj_01 - type_3
     obj_14 obj_08 - type_3
    )
 (:init 
    (pred_6 obj_11 obj_14)
    (pred_6 obj_05 obj_06)
    (pred_3 obj_05)
    (pred_6 obj_07 obj_06)
    (pred_3 obj_07)
    (pred_6 obj_12 obj_13)
    (pred_3 obj_12)
    (pred_6 obj_02 obj_06)
    (pred_3 obj_02)
    (pred_5 obj_03)
    (pred_6 obj_03 obj_08)
    (pred_5 obj_09)
    (pred_6 obj_09 obj_08)
    (pred_5 obj_04)
    (pred_6 obj_04 obj_08)
    (pred_2 obj_14 obj_10)
    (pred_2 obj_01 obj_08)
    (pred_2 obj_10 obj_06)
    (pred_2 obj_06 obj_13)
    (pred_2 obj_13 obj_01)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_09)
   (pred_4 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_03)) (not (pred_4 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_14)))
  )
)
)

; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 329101093 --problem-name spanner-s4-n3-l4-s329101093
(define (problem spanner-s4-n3-l4-s329101093)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_01 obj_13 obj_07 obj_09 - type_2
     obj_08 obj_05 obj_04 - type_3
     obj_03 obj_10 obj_06 obj_11 - type_1
     obj_02 obj_14 - type_1
    )
 (:init 
    (pred_4 obj_12 obj_02)
    (pred_4 obj_01 obj_06)
    (pred_3 obj_01)
    (pred_4 obj_13 obj_03)
    (pred_3 obj_13)
    (pred_4 obj_07 obj_10)
    (pred_3 obj_07)
    (pred_4 obj_09 obj_03)
    (pred_3 obj_09)
    (pred_1 obj_08)
    (pred_4 obj_08 obj_14)
    (pred_1 obj_05)
    (pred_4 obj_05 obj_14)
    (pred_1 obj_04)
    (pred_4 obj_04 obj_14)
    (pred_2 obj_02 obj_03)
    (pred_2 obj_11 obj_14)
    (pred_2 obj_03 obj_10)
    (pred_2 obj_10 obj_06)
    (pred_2 obj_06 obj_11)
)
 (:goal
  (and
   (pred_6 obj_08)
   (pred_6 obj_05)
   (pred_6 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_05)) (not (pred_6 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_02)))
  )
)
)

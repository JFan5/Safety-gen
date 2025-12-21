; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 918444216 --problem-name spanner-s4-n3-l4-s918444216
(define (problem spanner-s4-n3-l4-s918444216)
 (:domain spanner)
 (:objects 
     obj_03 - type_3
     obj_10 obj_14 obj_12 obj_04 - type_5
     obj_09 obj_05 obj_11 - type_4
     obj_08 obj_07 obj_02 obj_06 - type_2
     obj_13 obj_01 - type_2
    )
 (:init 
    (pred_2 obj_03 obj_13)
    (pred_2 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_2 obj_14 obj_07)
    (pred_1 obj_14)
    (pred_2 obj_12 obj_08)
    (pred_1 obj_12)
    (pred_2 obj_04 obj_07)
    (pred_1 obj_04)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_01)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_01)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_01)
    (pred_6 obj_13 obj_08)
    (pred_6 obj_06 obj_01)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_02 obj_06)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_05)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_13)))
  )
)
)

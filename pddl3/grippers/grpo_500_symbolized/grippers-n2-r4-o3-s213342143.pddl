(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_1
obj_11 obj_05 obj_04 obj_02 - type_3
obj_12 obj_07 obj_03 obj_08 - type_2
obj_01 obj_13 obj_09 - object)
(:init
(pred_4 obj_06 obj_03)
(pred_2 obj_06 obj_11)
(pred_2 obj_06 obj_05)
(pred_4 obj_10 obj_07)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_02)
(pred_3 obj_01 obj_08)
(pred_3 obj_13 obj_03)
(pred_3 obj_09 obj_08)
)
(:goal
(and
(pred_3 obj_01 obj_07)
(pred_3 obj_13 obj_12)
(pred_3 obj_09 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_06 obj_12) (pred_4 obj_10 obj_12))))
  )
)
)
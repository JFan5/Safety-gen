(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_2
obj_06 obj_10 obj_04 obj_13 - type_1
obj_12 obj_08 obj_05 obj_07 - type_3
obj_02 obj_03 obj_09 - object)
(:init
(pred_2 obj_11 obj_07)
(pred_1 obj_11 obj_06)
(pred_1 obj_11 obj_10)
(pred_2 obj_01 obj_12)
(pred_1 obj_01 obj_04)
(pred_1 obj_01 obj_13)
(pred_4 obj_02 obj_08)
(pred_4 obj_03 obj_05)
(pred_4 obj_09 obj_07)
)
(:goal
(and
(pred_4 obj_02 obj_12)
(pred_4 obj_03 obj_05)
(pred_4 obj_09 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_11 obj_12) (pred_2 obj_01 obj_12))))
  )
)
)
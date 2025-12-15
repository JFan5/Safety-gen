(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_01 - type_1
obj_07 obj_08 obj_06 obj_13 - type_3
obj_04 obj_10 obj_02 obj_03 - type_2
obj_05 obj_11 obj_09 - object)
(:init
(pred_3 obj_12 obj_04)
(pred_4 obj_12 obj_07)
(pred_4 obj_12 obj_08)
(pred_3 obj_01 obj_10)
(pred_4 obj_01 obj_06)
(pred_4 obj_01 obj_13)
(pred_2 obj_05 obj_04)
(pred_2 obj_11 obj_04)
(pred_2 obj_09 obj_02)
)
(:goal
(and
(pred_2 obj_05 obj_03)
(pred_2 obj_11 obj_04)
(pred_2 obj_09 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_12 obj_03) (pred_3 obj_01 obj_03))))
  )
)
)
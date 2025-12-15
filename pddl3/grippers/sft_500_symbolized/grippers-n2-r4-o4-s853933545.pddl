(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_09 - type_2
obj_06 obj_05 obj_10 obj_07 - type_1
obj_12 obj_03 obj_04 obj_13 - type_3
obj_02 obj_08 obj_11 obj_14 - object)
(:init
(pred_1 obj_01 obj_04)
(pred_4 obj_01 obj_06)
(pred_4 obj_01 obj_05)
(pred_1 obj_09 obj_13)
(pred_4 obj_09 obj_10)
(pred_4 obj_09 obj_07)
(pred_3 obj_02 obj_12)
(pred_3 obj_08 obj_03)
(pred_3 obj_11 obj_12)
(pred_3 obj_14 obj_03)
)
(:goal
(and
(pred_3 obj_02 obj_03)
(pred_3 obj_08 obj_04)
(pred_3 obj_11 obj_12)
(pred_3 obj_14 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_01 obj_03) (pred_1 obj_09 obj_03))))
  )
)
)
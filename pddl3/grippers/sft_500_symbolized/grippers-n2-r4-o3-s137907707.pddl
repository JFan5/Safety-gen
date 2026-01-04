(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_09 - type_2
obj_13 obj_12 obj_07 obj_04 - type_1
obj_08 obj_01 obj_10 obj_03 - type_3
obj_11 obj_05 obj_02 - object)
(:init
(pred_1 obj_06 obj_08)
(pred_4 obj_06 obj_13)
(pred_4 obj_06 obj_12)
(pred_1 obj_09 obj_10)
(pred_4 obj_09 obj_07)
(pred_4 obj_09 obj_04)
(pred_2 obj_11 obj_08)
(pred_2 obj_05 obj_03)
(pred_2 obj_02 obj_10)
)
(:goal
(and
(pred_2 obj_11 obj_10)
(pred_2 obj_05 obj_01)
(pred_2 obj_02 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_06 obj_03) (pred_1 obj_09 obj_03))))
  )
)
)
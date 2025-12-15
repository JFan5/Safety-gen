(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_04 obj_10 obj_13 obj_07 - type_3
obj_11 obj_12 obj_05 obj_03 - type_2
obj_02 obj_06 obj_08 - object)
(:init
(pred_3 obj_09 obj_05)
(pred_4 obj_09 obj_04)
(pred_4 obj_09 obj_10)
(pred_3 obj_01 obj_03)
(pred_4 obj_01 obj_13)
(pred_4 obj_01 obj_07)
(pred_2 obj_02 obj_11)
(pred_2 obj_06 obj_03)
(pred_2 obj_08 obj_03)
)
(:goal
(and
(pred_2 obj_02 obj_03)
(pred_2 obj_06 obj_11)
(pred_2 obj_08 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_09 obj_03) (pred_3 obj_01 obj_03))))
  )
)
)
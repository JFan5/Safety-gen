(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_1
obj_04 obj_11 obj_10 obj_05 - type_2
obj_03 obj_02 obj_12 - type_3
obj_09 obj_07 obj_06 - object)
(:init
(pred_1 obj_08 obj_12)
(pred_2 obj_08 obj_04)
(pred_2 obj_08 obj_11)
(pred_1 obj_01 obj_02)
(pred_2 obj_01 obj_10)
(pred_2 obj_01 obj_05)
(pred_4 obj_09 obj_12)
(pred_4 obj_07 obj_03)
(pred_4 obj_06 obj_12)
)
(:goal
(and
(pred_4 obj_09 obj_03)
(pred_4 obj_07 obj_02)
(pred_4 obj_06 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_08 obj_03) (pred_1 obj_01 obj_03))))
  )
)
)
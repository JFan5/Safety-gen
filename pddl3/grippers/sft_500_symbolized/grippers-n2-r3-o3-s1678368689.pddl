(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_02 - type_1
obj_10 obj_01 obj_04 obj_05 - type_3
obj_12 obj_08 obj_03 - type_2
obj_11 obj_07 obj_09 - object)
(:init
(pred_4 obj_06 obj_12)
(pred_3 obj_06 obj_10)
(pred_3 obj_06 obj_01)
(pred_4 obj_02 obj_08)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_05)
(pred_1 obj_11 obj_12)
(pred_1 obj_07 obj_08)
(pred_1 obj_09 obj_12)
)
(:goal
(and
(pred_1 obj_11 obj_03)
(pred_1 obj_07 obj_03)
(pred_1 obj_09 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_06 obj_03) (pred_4 obj_02 obj_03))))
  )
)
)
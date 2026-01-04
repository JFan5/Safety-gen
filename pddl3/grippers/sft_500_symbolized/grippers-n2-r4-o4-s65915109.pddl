(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_10 - type_3
obj_07 obj_12 obj_09 obj_05 - type_2
obj_04 obj_01 obj_03 obj_13 - type_1
obj_06 obj_11 obj_14 obj_08 - object)
(:init
(pred_4 obj_02 obj_03)
(pred_3 obj_02 obj_07)
(pred_3 obj_02 obj_12)
(pred_4 obj_10 obj_04)
(pred_3 obj_10 obj_09)
(pred_3 obj_10 obj_05)
(pred_1 obj_06 obj_04)
(pred_1 obj_11 obj_03)
(pred_1 obj_14 obj_03)
(pred_1 obj_08 obj_04)
)
(:goal
(and
(pred_1 obj_06 obj_03)
(pred_1 obj_11 obj_01)
(pred_1 obj_14 obj_04)
(pred_1 obj_08 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_02 obj_01) (pred_4 obj_10 obj_01))))
    (always (not (and (pred_4 obj_02 obj_03) (pred_4 obj_10 obj_03))))
  )
)
)
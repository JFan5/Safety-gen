(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_10 - type_1
obj_04 obj_11 obj_09 obj_05 - type_3
obj_13 obj_01 obj_08 obj_03 - type_2
obj_12 obj_06 obj_07 - object)
(:init
(pred_3 obj_02 obj_08)
(pred_1 obj_02 obj_04)
(pred_1 obj_02 obj_11)
(pred_3 obj_10 obj_03)
(pred_1 obj_10 obj_09)
(pred_1 obj_10 obj_05)
(pred_2 obj_12 obj_03)
(pred_2 obj_06 obj_08)
(pred_2 obj_07 obj_01)
)
(:goal
(and
(pred_2 obj_12 obj_01)
(pred_2 obj_06 obj_01)
(pred_2 obj_07 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_02 obj_01) (pred_3 obj_10 obj_01))))
    (always (not (and (pred_3 obj_02 obj_03) (pred_3 obj_10 obj_03))))
  )
)
)
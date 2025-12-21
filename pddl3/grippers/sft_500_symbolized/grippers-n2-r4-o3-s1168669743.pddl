(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_13 - type_1
obj_09 obj_08 obj_07 obj_05 - type_2
obj_01 obj_06 obj_04 obj_11 - type_3
obj_12 obj_10 obj_02 - object)
(:init
(pred_1 obj_03 obj_06)
(pred_3 obj_03 obj_09)
(pred_3 obj_03 obj_08)
(pred_1 obj_13 obj_04)
(pred_3 obj_13 obj_07)
(pred_3 obj_13 obj_05)
(pred_2 obj_12 obj_11)
(pred_2 obj_10 obj_01)
(pred_2 obj_02 obj_06)
)
(:goal
(and
(pred_2 obj_12 obj_01)
(pred_2 obj_10 obj_11)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_03 obj_01) (pred_1 obj_13 obj_01))))
    (always (not (and (pred_1 obj_03 obj_11) (pred_1 obj_13 obj_11))))
  )
)
)
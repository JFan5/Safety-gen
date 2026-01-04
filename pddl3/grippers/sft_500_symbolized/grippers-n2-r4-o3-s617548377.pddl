(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_1
obj_12 obj_06 obj_09 obj_11 - type_3
obj_01 obj_03 obj_10 obj_13 - type_2
obj_05 obj_07 obj_08 - object)
(:init
(pred_2 obj_04 obj_10)
(pred_4 obj_04 obj_12)
(pred_4 obj_04 obj_06)
(pred_2 obj_02 obj_13)
(pred_4 obj_02 obj_09)
(pred_4 obj_02 obj_11)
(pred_1 obj_05 obj_01)
(pred_1 obj_07 obj_03)
(pred_1 obj_08 obj_03)
)
(:goal
(and
(pred_1 obj_05 obj_03)
(pred_1 obj_07 obj_13)
(pred_1 obj_08 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_04 obj_03) (pred_2 obj_02 obj_03))))
    (always (not (and (pred_2 obj_04 obj_13) (pred_2 obj_02 obj_13))))
  )
)
)
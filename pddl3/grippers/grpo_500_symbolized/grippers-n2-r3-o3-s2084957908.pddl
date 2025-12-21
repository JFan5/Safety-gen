(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_02 - type_1
obj_09 obj_10 obj_06 obj_11 - type_3
obj_01 obj_12 obj_03 - type_2
obj_05 obj_07 obj_04 - object)
(:init
(pred_4 obj_08 obj_01)
(pred_2 obj_08 obj_09)
(pred_2 obj_08 obj_10)
(pred_4 obj_02 obj_03)
(pred_2 obj_02 obj_06)
(pred_2 obj_02 obj_11)
(pred_3 obj_05 obj_12)
(pred_3 obj_07 obj_03)
(pred_3 obj_04 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_03)
(pred_3 obj_07 obj_03)
(pred_3 obj_04 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_08 obj_03) (pred_4 obj_02 obj_03))))
  )
)
)
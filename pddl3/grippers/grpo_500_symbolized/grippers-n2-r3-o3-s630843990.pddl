(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_08 - type_1
obj_09 obj_11 obj_01 obj_10 - type_3
obj_03 obj_07 obj_04 - type_2
obj_06 obj_02 obj_12 - object)
(:init
(pred_4 obj_05 obj_03)
(pred_2 obj_05 obj_09)
(pred_2 obj_05 obj_11)
(pred_4 obj_08 obj_04)
(pred_2 obj_08 obj_01)
(pred_2 obj_08 obj_10)
(pred_3 obj_06 obj_03)
(pred_3 obj_02 obj_07)
(pred_3 obj_12 obj_03)
)
(:goal
(and
(pred_3 obj_06 obj_03)
(pred_3 obj_02 obj_04)
(pred_3 obj_12 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_05 obj_07) (pred_4 obj_08 obj_07))))
  )
)
)
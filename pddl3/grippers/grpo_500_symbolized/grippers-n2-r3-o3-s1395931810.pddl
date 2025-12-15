(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_02 - type_1
obj_09 obj_01 obj_11 obj_03 - type_3
obj_10 obj_04 obj_07 - type_2
obj_08 obj_12 obj_05 - object)
(:init
(pred_3 obj_06 obj_07)
(pred_4 obj_06 obj_09)
(pred_4 obj_06 obj_01)
(pred_3 obj_02 obj_04)
(pred_4 obj_02 obj_11)
(pred_4 obj_02 obj_03)
(pred_2 obj_08 obj_04)
(pred_2 obj_12 obj_07)
(pred_2 obj_05 obj_10)
)
(:goal
(and
(pred_2 obj_08 obj_07)
(pred_2 obj_12 obj_10)
(pred_2 obj_05 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_06 obj_07) (pred_3 obj_02 obj_07))))
  )
)
)
(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_1
obj_05 obj_08 obj_11 obj_01 - type_2
obj_12 obj_07 obj_09 - type_3
obj_03 obj_02 obj_04 - object)
(:init
(pred_1 obj_06 obj_12)
(pred_3 obj_06 obj_05)
(pred_3 obj_06 obj_08)
(pred_1 obj_10 obj_09)
(pred_3 obj_10 obj_11)
(pred_3 obj_10 obj_01)
(pred_2 obj_03 obj_07)
(pred_2 obj_02 obj_09)
(pred_2 obj_04 obj_12)
)
(:goal
(and
(pred_2 obj_03 obj_07)
(pred_2 obj_02 obj_12)
(pred_2 obj_04 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_06 obj_12) (pred_1 obj_10 obj_12))))
  )
)
)
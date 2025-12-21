(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_1
obj_06 obj_01 obj_05 obj_09 - type_2
obj_13 obj_11 obj_07 obj_12 - type_3
obj_03 obj_08 obj_10 - object)
(:init
(pred_1 obj_02 obj_11)
(pred_3 obj_02 obj_06)
(pred_3 obj_02 obj_01)
(pred_1 obj_04 obj_07)
(pred_3 obj_04 obj_05)
(pred_3 obj_04 obj_09)
(pred_2 obj_03 obj_12)
(pred_2 obj_08 obj_07)
(pred_2 obj_10 obj_11)
)
(:goal
(and
(pred_2 obj_03 obj_07)
(pred_2 obj_08 obj_07)
(pred_2 obj_10 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_12) (pred_1 obj_04 obj_12))))
  )
)
)
(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_03 - type_2
obj_10 obj_05 obj_01 obj_08 - type_3
obj_02 obj_11 obj_04 - type_1
obj_07 obj_06 - object)
(:init
(pred_4 obj_09 obj_11)
(pred_1 obj_09 obj_10)
(pred_1 obj_09 obj_05)
(pred_4 obj_03 obj_02)
(pred_1 obj_03 obj_01)
(pred_1 obj_03 obj_08)
(pred_3 obj_07 obj_02)
(pred_3 obj_06 obj_02)
)
(:goal
(and
(pred_3 obj_07 obj_11)
(pred_3 obj_06 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_09 obj_11) (pred_4 obj_03 obj_11))))
  )
)
)